import React, { Component } from "react";
import { render } from "react-dom";
import RecipeItem from "./RecipeItem";

class RecipesSearchForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchString: "",
      isSearching: false,
      error: null,
      isSearched: false,
      recipes: [],
    };
  }
  handleChange = (event) => {
    this.setState({ searchString: event.target.value });
  };

  handleSubmit = (event) => {
    this.setState({ isSearching: true });
    // const uri = "http://localhost:3000";
    // const searchString = encodeURI(uri);
    fetch(`/recipes/search.json?search=${encodeURI(this.state.searchString)}`)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw response;
      })
      .then((result) => {
        // alert(result);
        // alert(result.results);
        this.setState({
          isSearched: true,
          recipes: result,
        });
      })
      .catch((error) => {
        console.error("Error while fetching recipes: ", error);
      });
    event.preventDefault();
    this.setState({ isSearching: false });
  };

  render() {
    const uuid = require("uuid");
    return (
      <div className="ReactRecipes">
        <form onSubmit={this.handleSubmit}>
          <input
            value={this.state.value}
            onChange={this.handleChange}
            placeholder="Ingredients?"
          />
          <input type="submit" value="Rechercher" />
        </form>
        <ul className="RecipesList">
          {this.state.recipes.map((recipe) => (
            <li key={uuid.v4()}>
              <RecipeItem
                name={recipe.name}
                ingredients={recipe.ingredients}
                cook_time={recipe.cook_time}
                prep_time={recipe.prep_time}
                total_time={recipe.total_time}
                author={recipe.author}
                nb_comments={recipe.nb_comments}
                people_quantity={recipe.npeople_quantity}
                budget={recipe.budget}
                difficulty={recipe.difficulty}
                rate={recipe.rate}
                author_tip={recipe.author_tip}
                tags={recipe.tags}
              />
            </li>
          ))}
        </ul>
      </div>
    );
  }
}

export default RecipesSearchForm;
