package db

import (
	"database/sql"
	"errors"
	"time"
)

type User struct {
	ID           string
	FirstName    string
	LastName     string
	Email        string
	PasswordHash string
	Role         string
	ProfileImage string
	Description  string
	Location     string
	Web          string
	CreatedAt    *time.Time
}

var IDNotFoundErr = errors.New("IdNotFound")

func (data SQLDataStorage) GetUsers(limit int, offset int) ([]*User, error) {

	if limit == 0 {
		limit = 100
	}

	queryArgs := []interface{}{limit, offset}

	query := (`
	SELECT u.id, u.first_name, u.last_name, u.email, u.password_hash, u.role, u.profile_image, u.description, u.location, u.web, u.created_at
	FROM user_account u
	LIMIT $1
	OFFSET $2
	`)

	rows, err := data.DB.Query(query, queryArgs...)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var users []*User = make([]*User, 0)

	for rows.Next() {
		user, err := userFromRows(rows)
		if err != nil {
			return nil, err
		}
		users = append(users, user)
	}

	if err = rows.Err(); err != nil {
		return nil, err
	}

	return users, nil
}

func (data SQLDataStorage) GetUser(userID string) (*User, error) {
	queryArgs := []interface{}{userID}

	query := (`
	SELECT u.id, u.first_name, u.last_name, u.email, u.password_hash, u.role, u.profile_image, u.description, u.location, u.web, u.created_at
	FROM user_account u
	WHERE u.id = $1
	`)

	rows, err := data.DB.Query(query, queryArgs...)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var user *User

	for rows.Next() {
		user, err = userFromRows(rows)
		if err != nil {
			return nil, err
		}
	}
	if user == nil {
		return nil, IDNotFoundErr
	}

	if err = rows.Err(); err != nil {
		return nil, err
	}

	return user, nil
}

func (data SQLDataStorage) StoreUser(user *User) error {

	query := `
	INSERT INTO user_account (id, first_name, last_name, email, password_hash, role, profile_image, description, location, web, created_at) 
	VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
	RETURNING id
	`
	arguments := []interface{}{
		user.ID,
		user.FirstName,
		user.LastName,
		user.Email,
		user.PasswordHash,
		user.Role,
		user.ProfileImage,
		user.Description,
		user.Location,
		user.Web,
		user.CreatedAt,
	}

	err := data.DB.QueryRow(
		query,
		arguments...,
	).Scan(&user.ID)
	if err != nil {
		return err
	}

	return nil
}

func userFromRows(rows *sql.Rows) (*User, error) {
	user := &User{}
	err := rows.Scan(
		&user.ID,
		&user.FirstName,
		&user.LastName,
		&user.Email,
		&user.PasswordHash,
		&user.Role,
		&user.ProfileImage,
		&user.Description,
		&user.Location,
		&user.Web,
		&user.CreatedAt,
	)
	if err != nil {
		return nil, err
	}
	return user, nil
}
