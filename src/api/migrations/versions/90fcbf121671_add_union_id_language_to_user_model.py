"""add union id language to user model

Revision ID: 90fcbf121671
Revises: 01891133d0a2
Create Date: 2024-09-05 06:58:07.035760

"""

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = "90fcbf121671"
down_revision = "01891133d0a2"
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table("user_info", schema=None) as batch_op:
        batch_op.add_column(
            sa.Column(
                "user_unicon_id",
                sa.String(length=255),
                nullable=True,
                comment="user unicon id",
            )
        )
        batch_op.add_column(
            sa.Column(
                "user_language",
                sa.String(length=30),
                nullable=True,
                comment="user language",
            )
        )
        batch_op.create_index(
            batch_op.f("ix_user_info_user_unicon_id"), ["user_unicon_id"], unique=False
        )

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table("user_info", schema=None) as batch_op:
        batch_op.drop_index(batch_op.f("ix_user_info_user_unicon_id"))
        batch_op.drop_column("user_language")
        batch_op.drop_column("user_unicon_id")

    # ### end Alembic commands ###
