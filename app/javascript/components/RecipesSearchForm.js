import React, { Component } from "react";
import { render } from "react-dom";

class RecipesSearchForm extends React.Component {
  contructor(props) {
    super(props);
    this.state = {
      error: null,
      isLoaded: false,
      recipes: []
    };
  }
  onFormSubmit() {
    fetch("https://localhost:3000/recipes/search?search=")
      .then(res => res.json())
      .then(
        (result) => {
          this.setState({
            isLoaded: true,
            items: result.items
          });
  }
  render() {
    return (
      <div className="ReactRecipes">
        <form>
          <input type="text" placeholder="Ingredients" />
          <button onClick={this.onFormSubmit}>Submit</button>
        </form>
      </div>
    );
  }
}

export default RecipesSearchForm;
