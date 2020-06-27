package view

import (
	"time"

	"github.com/teamb-prince/fixtures_builder/models/db"
)

type User struct {
	ID           string     `json:"id"`
	FirstName    string     `json:"first_name"`
	LastName     string     `json:"last_name"`
	Email        string     `json:"email"`
	PasswordHash string     `json:"password_hash"`
	Role         string     `json:"role"`
	ProfileImage string     `json:"profile_image"`
	Description  string     `json:"description"`
	Location     string     `json:"location"`
	Web          string     `json:"web"`
	CreatedAt    *time.Time `json:"created_at"`
}

type RequestUser struct {
	ID       string `json:"id"`
	Email    string `json:"email"`
	Password string `json:"password"`
}

type UserInfo struct {
	ID           string     `json:"id"`
	FirstName    string     `json:"first_name"`
	LastName     string     `json:"last_name"`
	ProfileImage string     `json:"profile_image"`
	Description  string     `json:"description"`
	Location     string     `json:"location"`
	Web          string     `json:"web"`
	CreatedAt    *time.Time `json:"created_at"`
}

func NewUserInfo(user *db.User) *UserInfo {

	userInfo := &UserInfo{
		user.ID,
		user.FirstName,
		user.LastName,
		user.ProfileImage,
		user.Description,
		user.Location,
		user.Web,
		user.CreatedAt,
	}

	return userInfo
}

func NewUsersInfo(usersInfo []*db.User) []*UserInfo {

	var result []*UserInfo = make([]*UserInfo, 0)
	for _, userInfo := range usersInfo {
		result = append(result, NewUserInfo(userInfo))
	}

	return result
}

func NewUser(user *db.User) *User {

	u := &User{
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

	return u
}

func NewUsers(users []*db.User) []*User {

	var result []*User = make([]*User, 0)
	for _, user := range users {
		result = append(result, NewUser(user))
	}

	return result
}
