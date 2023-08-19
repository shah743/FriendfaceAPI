
## **Friendface API Setup Guide**

### **Prerequisites:**

#### 1. **Ruby and Ruby on Rails**

The application runs on Ruby on Rails. You'll first need to install Ruby and then Rails.

**a. Installing Ruby**  
Different systems have different methods for installing Ruby:

- **macOS** (using Homebrew):

  ```bash
  brew install rbenv
  rbenv init
  rbenv install 3.1.2
  ```

- **Ubuntu**:

  ```bash
  sudo apt-get install ruby-full
  ```

- **Windows**:

    - Use [RubyInstaller](https://rubyinstaller.org/).

**b. Installing Rails**

Once Ruby is installed:

```bash
gem install rails
```

#### 2. **PostgreSQL**

The application uses PostgreSQL. Ensure it's installed and running.

- **macOS** (using Homebrew):

  ```bash
  brew install postgresql
  brew services start postgresql
  ```

- **Ubuntu**:

  ```bash
  sudo apt-get install postgresql postgresql-contrib
  sudo service postgresql start
  ```

- **Windows**:

    - Download and install from [PostgreSQL official site](https://www.postgresql.org/download/windows/).

---

### **Running the Application:**

#### 1. **Clone the Repository**

Assuming the application is in a Git repository:

```bash
git clone https://github.com/shah743/FriendfaceAPI
cd FriendfaceAPI
```


#### 2. **Bundle Install**

This will install all the required Ruby gems:

```bash
bundle install
```

#### 3. **Set up the Database**

```bash
rails db:create
rails db:migrate
```

If there's seed data:

```bash
rails db:seed
```

#### 4. **Running the Rails Server**

```bash
rails s
```

**Accessing the Application:**

- **Main Application**:  
  Open [http://localhost:3000](http://localhost:3000) in your browser. If everything is set up correctly, your Rails application should be running.

- **Most Likes**:  
  To get the day(s) with the most likes, visit: [http://localhost:3000/likes/most_likes](http://localhost:3000/likes/most_likes)

- **Streaks**:  
  To retrieve streaks of days with increasing likes, visit: [http://localhost:3000/likes/streaks](http://localhost:3000/likes/streaks)

- **Creating Likes**:  
  To like a post, send a POST request to: [http://localhost:3000/likes](http://localhost:3000/likes)
  
---

### **Running the Tests:**


#### 1. **Run RSpec:**

```bash
rspec
```

This will execute all the specs/tests written for the application. Ensure they all pass.

---